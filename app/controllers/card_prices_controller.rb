class CardPricesController < ApplicationController
  before_action :set_card_price, only: [:show, :edit, :update, :destroy]

  # GET /card_prices
  # GET /card_prices.json
  def index
    @card_prices = CardPrice.all
  end

  # GET /card_prices/1
  # GET /card_prices/1.json
  def show
  end

  # GET /card_prices/new
  def new
    @card_price = CardPrice.new
  end

  # GET /card_prices/1/edit
  def edit
  end

  # POST /card_prices
  # POST /card_prices.json
  def create
    @card_price = CardPrice.new(card_price_params)

  logger.debug(card_price_params)
    respond_to do |format|
      if @card_price.save
        format.html { redirect_to @card_price, notice: 'Card price was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card_price }
      else
        format.html { render action: 'new' }
        format.json { render json: @card_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_prices/1
  # PATCH/PUT /card_prices/1.json
  def update
    respond_to do |format|
      if @card_price.update(card_price_params)
        format.html { redirect_to @card_price, notice: 'Card price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_prices/1
  # DELETE /card_prices/1.json
  def destroy
    @card_price.destroy
    respond_to do |format|
      format.html { redirect_to card_prices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_price
      @card_price = CardPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_price_params
      params.require(:card_price).permit(:price, :time, :card_id)
    end
end
