port module TibiaKey exposing (..)

import Char exposing (..)
import Dom
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Keyed as Keyed
import Html.Lazy exposing (lazy, lazy2)
import Json.Decode as Json
import Keyboard exposing (..)
import String
import Task


main : Program (Maybe Model) Model Msg
main =
  Html.programWithFlags
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }


port setStorage : Model -> Cmd msg


{-| We want to `setStorage` on every update. This function adds the setStorage
command for every step of the update function.
-}
updateWithStorage : Msg -> Model -> ( Model, Cmd Msg )
updateWithStorage msg model =
  let
      ( newModel, cmds ) =
        update msg model
  in
      ( newModel
      , Cmd.batch [ setStorage newModel, cmds ]
      )



-- MODEL


-- The full application state TibiaKey
type alias Model =
  { keys : List Key
  , uid : Int
  , activeKey : Int
  }


type alias Key =
  { label : String
  , width : Float
  , spacer : Bool
  , code : Int
  }

newKeyWithSize : Float -> String -> Int -> Key
newKeyWithSize width label code =
  { label = label
  , width = width
  , spacer = False
  , code = code
  }

newSpacer : Float -> Key
newSpacer width =
  let
      key = newKeyWithSize width "" 0
  in
      { key | spacer = True }

newKey : String -> Int -> Key
newKey = newKeyWithSize 1

allKeys : List (List Key)
allKeys =
  [ [ newKey "Esc" 27, newSpacer 0.5,  newKey "F1" 0, newKey "F2" 0, newKey "F3" 0, newKey "F4" 0, newSpacer 0.5, newKey "F5" 0, newKey "F6" 0, newKey "F7" 0, newKey "F8" 0, newSpacer 0.5, newKey "F9" 0, newKey "F10" 0, newKey "F11" 0, newKey "F12" 0 ]
  , [ newKey "`" 192, newKey "1" 49, newKey "2" 50, newKey "3" 51, newKey "4" 52, newKey "5" 53, newKey "6" 54, newKey "7" 55, newKey "8" 56, newKey "9" 57, newKey "0" 48, newKey "-" 189, newKey "=" 187, newKeyWithSize 1.5 "Bksp" 8 ]
  , [ newKeyWithSize 1.5 "Tab" 9, newKey "Q" 81, newKey "W" 87, newKey "E" 69, newKey "R" 82, newKey "T" 84, newKey "Y" 89, newKey "U" 85, newKey "I" 73, newKey "O" 79, newKey "P" 80, newKey "[" 219, newKey "]" 221, newKey "\\" 220 ]
  , [ newKeyWithSize 1.75 "CapsLock" 0, newKey "A" 65, newKey "S" 83, newKey "D" 68, newKey "F" 70, newKey "G" 71, newKey "H" 72, newKey "J" 74, newKey "K" 75, newKey "L" 76, newKey ";" 186, newKey "'" 222, newKeyWithSize 1.75 "Enter" 13 ]
  , [ newKeyWithSize 2.25 "Shift" 16, newKey "Z" 90, newKey "X" 88, newKey "C" 67, newKey "V" 86, newKey "B" 66, newKey "N" 78, newKey "M" 77, newKey "," 188, newKey "." 190, newKey "/" 191, newKeyWithSize 2.25 "Shift" 16 ]
  , [ newKeyWithSize 1.25 "Control" 17, newKey "Win" 91, newKey "Alt" 18, newKeyWithSize 6.0 "Space" 32, newKey "Alt" 225, newKey "Win" 91, newKey "Menu" 93, newKeyWithSize 2.25 "Control" 17 ]
  ]


defaultModel : Model
defaultModel =
  { keys =
    [ ]
    , uid = 0
    , activeKey = -1
  }


init : Maybe Model -> ( Model, Cmd Msg )
init savedModel =
  Maybe.withDefault defaultModel savedModel ! []


-- UPDATE


{-| Users of our app can trigger messages by clicking and typing. These
messages are fed into the `update` function as they occur, letting us react
to them.
-}
type Msg
  = NoOp
  | KeyDown Int
  | KeyUp Int


-- How we update our Model on a given Msg?
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      model ! []
    KeyDown code ->
      { model | activeKey = (Debug.log "code" code)  } ! []
    KeyUp code ->
      { model | activeKey = -1  } ! []

-- VIEW


view : Model -> Html Msg
view model =
  div
  [ class "tibiakey-wrapper"
  ]
  [ section
  [ class "tibiakey" ]
  [ viewHeader ""
  , lazy2 viewKeys model.activeKey model.keys
  ]
  , infoFooter
  ]


viewHeader : String -> Html Msg
viewHeader task =
  header
  [ class "header" ]
  [ h1 [] [ text "Tibia Key" ]
  ]


subscriptions: Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Keyboard.downs (\code -> KeyDown code)
    , Keyboard.ups (\code -> KeyUp code)
    ]

-- VIEW ALL KEYS


viewKeys : Int -> List Key -> Html Msg
viewKeys activeKey keys =
  section
  [ class "main"
  ]
  ( List.map (viewRow activeKey) allKeys )

viewRow : Int -> List Key -> Html Msg
viewRow activeKey row =
  ul [ class "keyrow" ] <|
    List.map (viewKey activeKey) row


viewKey : Int -> Key -> Html Msg
viewKey activeKey key =
  li
  [ classList [ ( "spacer", key.spacer ), ( "active", key.code == activeKey ) ]
  , style
  [ ("height", "50px")
  , ("width", (toString (50 * key.width)) ++ "px")
  ]
  ]
  [ div
  [ style
  [ ("padding-top", "13px") ]
  ] [ text key.label ] ]



-- VIEW CONTROLS AND FOOTER


infoFooter : Html msg
infoFooter =
  footer [ class "info" ]
  [ p []
  [ text "Written by "
  , a [ href "https://github.com/luan" ] [ text "Luan Santos" ]
  ]
  ]
