class InvoicesController < ApplicationController
      # before action to sert clients but restricted to specific actions (define the method in this file)

      # add destory action

      # add invoice status

  
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

    params = invoice_params
    params["total"] = Invoice.calculate_total(params[:items_attributes])
    @invoice = Invoice.new(params)

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
        .permit(:invoice_number, :user_id, :client,
          items_attributes: [:id, :description, :price])
    end

end
