class BillsController < ApplicationController
  def create
    Bill.create! receipt: params[:receipt], name: params[:name]

    render status: :created
  end

  def index
    date_since = Date.new(params[:year].to_i, params[:month].to_i, 1)
    date_until = date_since.end_of_month
    @bills = Bill.where('created_at BETWEEN ? AND ?', date_since, date_until)

    render status: :ok
  end
end