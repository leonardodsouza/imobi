class ProprietariosController < ApplicationController
  before_action :set_proprietario, only: [:show, :edit, :update, :destroy]

  # GET /proprietarios
  # GET /proprietarios.json
  def index
    @proprietarios = Proprietario.all
  end

  # GET /proprietarios/1
  # GET /proprietarios/1.json
  def show
  end

  # GET /proprietarios/new
  def new
    @proprietario = Proprietario.new
  end

  # GET /proprietarios/1/edit
  def edit
  end

  # POST /proprietarios
  # POST /proprietarios.json
  def create
    @proprietario = Proprietario.new(proprietario_params)

    respond_to do |format|
      if @proprietario.save
        format.html { redirect_to edit_imovel_path(@proprietario.imovel_id), notice: 'Proprietario was successfully created.' }
        format.json { render :show, status: :created, location: @proprietario }
      else
        format.html { render :new }
        format.json { render json: @proprietario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proprietarios/1
  # PATCH/PUT /proprietarios/1.json
  def update
    respond_to do |format|
      if @proprietario.update(proprietario_params)
        format.html { redirect_to edit_imovel_path(@proprietario.imovel_id), notice: 'Proprietario was successfully updated.' }
        format.json { render :show, status: :ok, location: @proprietario }
      else
        format.html { render :edit }
        format.json { render json: @proprietario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proprietarios/1
  # DELETE /proprietarios/1.json
  def destroy
    @proprietario.destroy
    respond_to do |format|
      format.html { redirect_to proprietarios_url, notice: 'Proprietario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proprietario
      @proprietario = Proprietario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proprietario_params
      params.require(:proprietario).permit(:imovel_id, :nome, :telefone, :email, :nascimento, :endereco, :profissao, :estado_civil, :conjuge)
    end
end
