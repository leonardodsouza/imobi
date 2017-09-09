class ImoveisController < ApplicationController
  before_action :set_imovel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, except: [:index, :show, :categoria]

  # GET /imoveis
  # GET /imoveis.json
  def index
    @categoria = params[:categoria]
    @tipo = params[:tipo]
    @cidade = params[:cidade]
    @bairro = params[:bairro]
    @dormitorios = params[:dormitorios]
    @banheiros = params[:banheiros]
    @garagem = params[:garagem]
    @preco_minimo = params[:preco_minimo]
    @preco_maximo = params[:preco_maximo]
    @todos = "/ TODOS OS IMÓVEIS"
    @imoveis = Imovel.search(params).paginate(:page=> params[:page], :per_page => 20).order(created_at: :desc)
  end

  def categoria
    @categoria = params[:id]
    @imoveis = Imovel.where('categoria_id = ?', params[:id]).paginate(:page=> params[:page], :per_page => 20).order(created_at: :desc)
  end

  # GET /imoveis/1
  # GET /imoveis/1.json
  def show
    @imovel.increment!(:visualizacoes)
    @mensagem = Mensagem.new
    @imoveis = Imovel.where('tipo_id = ? and categoria_id = ? and situacao_id != ?', @imovel.tipo_id, @imovel.categoria_id, 3).limit(4).order(created_at: :desc)
  end

  # GET /imoveis/new
  def new
    @imovel = Imovel.new
  end

  # GET /imoveis/1/edit
  def edit
    @foto = Foto.new
    @fotos = Foto.where('imovel_id =?', @imovel).order(created_at: :desc)
  end

  # POST /imoveis
  # POST /imoveis.json
  def create
    @imovel = Imovel.new(imovel_params)

    respond_to do |format|
      if @imovel.save
        format.html { redirect_to edit_imovel_path(@imovel)}
        format.json { render :show, status: :created, location: @imovel }
      else
        format.html { render :new }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imoveis/1
  # PATCH/PUT /imoveis/1.json
  def update
    @imovel.update(imovel_params)
    flash.now[:notice] = "Atualizado com sucesso"
    @imovel = Imovel.find(@imovel.id)
  end

  # DELETE /imoveis/1
  # DELETE /imoveis/1.json
  def destroy
    @imovel.destroy
    respond_to do |format|
      format.html { redirect_to imoveis_url, notice: 'Imovel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imovel
      @imovel = Imovel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imovel_params
      params.require(:imovel).permit(:capa, :categoria_id, :tipo_id, :situacao_id, :cidade_id, :bairro_id, :descricao, :dormitorios, :banheiros, :garagem, :area, :valor, :visualizacoes)
    end
end
