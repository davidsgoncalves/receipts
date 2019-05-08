class BillsController < ApplicationController
  def create
    Bill.create! receipt: params[:receipt], name: params[:name]

    render status: :ok
  end
end