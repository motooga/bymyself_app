class UsersController < ApplicationController
   def show

      @user = User.find(params[:id])
      @tasks = Task.includes(:user)
   end
 
 



end
