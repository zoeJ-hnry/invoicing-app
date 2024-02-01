class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    @invoice.items.build
  end

  def create

    @invoice = Invoice.new(invoice_params)
    
    # where to get user_id from? doesnt make sense to pass from form 
    if @invoice.save
      redirect_to @invoice
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def invoice_params
      params
        .require(:invoice)
        .permit(:invoice_number, :total, :user_id,
          items_attributes: [:id, :description, :price])
    end

end
