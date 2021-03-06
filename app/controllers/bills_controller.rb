class BillsController < ApplicationController
  def create
    bill = Bill.create! bill_params


    render status: :created
  end

  def index
    render status: :bad_request unless params[:year] && params[:month]
    date_since = Date.new(params[:year].to_i, params[:month].to_i, 1)
    date_until = date_since.end_of_month
    @uniq_bills = Bill.where('starts_at < ? AND paid != true', Date.new(date_until))
    @bills = Bill.where('created_at BETWEEN ? AND ?', date_since, date_until)

    render status: :ok
  end

  def update
    @bill = Bill.find_by_id(params[:id])

    if @bill&.update! bill_params
      render status: @status = :ok
    else
      render status: @status =  :no_content
    end
  end

  def show
    @bill = Bill.find_by_id(params[:id])

    if @bill
      render status: @status = :ok
    else
      render status: @status = :not_found
    end
  end

  def destroy
    @bill = Bill.find_by_id(params[:id])

    if @bill&.delete
      render status: :no_content
    else
      render status: :bad_request
    end
  end

  private

  def bill_params
    params.permit(:type,
        :fixed_value,
        :name,
        :value,
        :starts_at,
        :installments,
        :payday_limit,
        :late_fine,
        :require_doc,
        :require_receipt,
        :obs)
  end
end