class UsersController < ApplicationController

    def index
        users = User.all
        render json: {data:users}
    end

    def create
        user = User.create(user_params)
        render json: {data:user, message: "User created successfully"}
    end

    def update
        id = params[:id].to_i
        user = User.find(id)
        User.update(user_params)
        render json: {message:"User updated successfully"}
    end

    # TODO: destroy and show

    private

    def user_params
        params.permit :email, :password
    end
end
