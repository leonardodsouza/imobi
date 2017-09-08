class MensagensController < ApplicationController
  before_action :set_mensagem, only: [:show, :edit, :update, :destroy]

  # GET /mensagens
  # GET /mensagens.json
  def index
    @mensagens = Mensagem.all.order(created_at: :desc)
  end

  # GET /mensagens/1
  # GET /mensagens/1.json
  def show
    @mensagem.update_columns(visualizado: 'sim')
  end

  # GET /mensagens/new
  def new
    @mensagem = Mensagem.new
  end

  # GET /mensagens/1/edit
  def edit
  end

  # POST /mensagens
  # POST /mensagens.json
  def create
    @mensagem = Mensagem.new(mensagem_params)
    @mensagem.save
    flash[:notice] = 'Recebemos sua mensagem.'
    @link = imovel_url(@mensagem.imovel_id)
    EmailsMailer.informacoes(@mensagem, @link).deliver_now
  end

  # PATCH/PUT /mensagens/1
  # PATCH/PUT /mensagens/1.json
  def update
    respond_to do |format|
      if @mensagem.update(mensagem_params)
        format.html { redirect_to @mensagem, notice: 'Mensagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensagem }
      else
        format.html { render :edit }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagens/1
  # DELETE /mensagens/1.json
  def destroy
    @mensagem.destroy
    respond_to do |format|
      format.html { redirect_to mensagens_url, notice: 'Mensagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagem
      @mensagem = Mensagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensagem_params
      params.require(:mensagem).permit(:imovel_id, :visualizado, :nome, :email, :telefone, :mensagem)
    end
end
