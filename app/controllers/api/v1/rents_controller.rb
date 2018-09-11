# frozen_string_literal: true

module Api
  module V1
    class RentsController < Api::V1::ApiController
      include Wor::Paginate

      def index
        authorize params[:user_id], :logged_user?, policy_class: UserPolicy
        render_paginated User.find(params[:user_id]).rent
      end

      def create
        rent = Rent.new(create_params_sanitized)
        authorize rent.user_id, :logged_user?, policy_class: UserPolicy
        if rent.save
          RentMailer.new_rent_notification(rent.id).deliver_later
          render json: rent, status: :found
        else
          render json: rent.errors.messages, status: :bad_request
        end
      end

      private

      def create_params_sanitized
        params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
      end
    end
  end
end
