class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[edit update destroy]
  before_action :authenticate_user!, except: %i[show index]

  # GET /entities or /entities.json
  def index
    @group = Group.find(params[:group_id])
    @entity = Entity.where(group_id: params[:group_id]).order(created_at: :desc)
  end

  # GET /entities/1 or /entities/1.json
  def show
    @entity = Entity.find(params[:id])
  end

  # GET /entities/new
  def new
    @entity = Entity.new
    @group = Group.where(user_id: current_user.id)
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @user = current_user

    @entity = @user.entities.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to user_group_entities_path(@user), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.includes(:user, :groups).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id, :group_id)
  end
end
