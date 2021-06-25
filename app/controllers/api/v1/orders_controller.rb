module Api
    module V1
        class OrdersController < ApplicationController
            def index
                orders = Order.order('Created_on');
                render json: {status: 'success', message: 'loaded orders', data:orders}, status: :ok
            end
            def show
                order=Order.find(params[:order_id])
                render json: {status: 'success', message: 'loaded order', data:order}, status: :ok
            end
            def update
                order = Order.find(params[:order_id])
                if order.update_attributes(order_params)
                    render json: {status: 'success', message: 'updated status', data:order}, status: :ok
                else
                    render json: {status: 'Error', message: 'Orders not updated', data:order.errors}, status: :unprocessable_entity
                end
            end

            private

            def order_params
                params.permit(:status)
            end
        end
    end
end