module Api
    module V1
        class UsersController < ApplicationController
            # Agregar acceso de autorización
            before_action :authenticate_with_token!, only: [:update, :destroy]
            respond_to :json

            def Index
                @user = User.all
                respond_with @user
            end

            # Leer usuario (HTTP verb GET)
            def show
                @user = User.find params[:id]
                render json: {status: 'SUCCESS', message: 'Show user', data: @user}, status: :ok
                #respond_with @user
                #respond_with User.find(params[:id])
            end

            # Crear usuario (HTTP verb POST)
            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user, status: 201, message: "Created user", data: @user
                # Create the user from params
                #@user = User.new(params[:user])
                #if @user.save
                    # Deliver the signup email
                    #UserNotifierMailer.send_signup_email(@user).deliver
                    #redirect_to(@user, :notice => 'User created')
                else
                    #render json: { errors: user.errors }, status: 422
                    render :action => 'new'
                end
            end

            # Actualizar usuario (HTTP verb PUT)
            def update
                #user = User.find(params[:id])
                #if user.update(user_params)
                #    render json: user, status: 200, message: "Updated user", data: user
                #else
                #    render json: { errors: user.errors }, status: 422
                #end
                user = current_user
                if user.update(user_params)
                    render json: {status: 'SUCCESS', message: 'Updated user', data: user}, status: :ok
                else
                    render json: {status: 'Error', message: 'User not updated', data: user.errors }, status: :unprocessable_entity
                end
            end

            # Elimianr usuario (HTTP verb DELETE)
            def destroy
                #user = User.find(params[:id])
                #user.destroy
                #head 204
                current_user.destroy
                render json: {status: 'SUCCESS', message: 'Deleted user', data: current_user}, status: :ok
            end

            private

            def user_params
                params.require(:user).permit(:email, :password, :password_confirmation)
            end            

        end
    end
end

