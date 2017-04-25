class KeySetsController < ApplicationController
  before_action :set_key_set, only: [:show, :edit, :update, :destroy]

  # GET /key_sets
  # GET /key_sets.json
  def index
    @key_sets = KeySet.all
  end

  # GET /key_sets/1
  # GET /key_sets/1.json
  def show
  end

  # GET /key_sets/new
  def new
    @key_set = KeySet.new
  end

  # GET /key_sets/1/edit
  def edit
  end

  # POST /key_sets
  # POST /key_sets.json
  def create
    @key_set = KeySet.new(key_set_params)

    respond_to do |format|
      if @key_set.save
        format.html { redirect_to @key_set, notice: 'Key set was successfully created.' }
        format.json { render :show, status: :created, location: @key_set }
      else
        format.html { render :new }
        format.json { render json: @key_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_sets/1
  # PATCH/PUT /key_sets/1.json
  def update
    respond_to do |format|
      if @key_set.update(key_set_params)
        format.html { redirect_to @key_set, notice: 'Key set was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_set }
      else
        format.html { render :edit }
        format.json { render json: @key_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_sets/1
  # DELETE /key_sets/1.json
  def destroy
    @key_set.destroy
    respond_to do |format|
      format.html { redirect_to key_sets_url, notice: 'Key set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_set
      @key_set = KeySet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_set_params
      params.require(:key_set).permit(:name, :vocation_id, key_assignments_attributes: [:id, :key_sequence, :action_type, :action_object])
    end
end
