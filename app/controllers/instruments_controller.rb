class InstrumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = current_user.id
    if @instrument.save
    redirect_to instrument_path(@instrument), notice: '新しく楽器を登録しました。'
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
    if @instrument.user != current_user
      redirect_to instrument_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @instrument = Instrument.find(params[:id])
    if @instrument.update(instrument_params)
       redirect_to instrument_path(@instrument), notice: '更新に成功しました。'
    else
       render :edit
    end
  end

  private
    def instrument_params
      params.require(:instrument).permit(:title, :description, :image, :price)
    end
end
