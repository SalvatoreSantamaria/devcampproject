class PortfoliosController < ApplicationController
    layout 'portfolio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all 

    def index
        @portfolio_items = Portfolio.by_position
    end

    def sort
        params[:order].each do |key, value|
            Portfolio.find(value[:id]).update(position: value[:position])
        end
        
        render nothing: true 
    end

    def angular
        @angular_portfolio_items = Portfolio.angular
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params) #

        respond_to do |format| 
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: 'Your portfolio_item is now live'}
            else  
                format.html { render :new }
            end
        end
    end

    def edit
        @portfolio_item = Portfolio.find(params[:id])
        #3.times { @portfolio_item.technologies.build} 

    end

    def update
        @portfolio_item = Portfolio.find(params[:id])
        respond_to do |format| 
            if @portfolio_item.update(portfolio_params)
                format.html { redirect_to portfolios_path, notice: 'Your portfolio_item is now live'}
            else  
                format.html { render :edit }
            end
        end
    end

    def show
        @portfolio_item = Portfolio.find(params[:id])
    end

    def destroy
    
    #perform lookup
    @portfolio_item = Portfolio.find(params[:id])

    #delete item
    @portfolio_item.destroy

    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
    end
  end

  private 

  def portfolio_params  #:_destroy is from cocoon gem
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:id, :name, :_destroy])
  end
end
