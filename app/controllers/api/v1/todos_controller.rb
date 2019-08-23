module Api
	module V1
		class TodosController < ApplicationController
			def index
				todos = Todo.order("created_at DESC")
				puts todos.inspect
				render json: todos
			end

			def create
				puts params.inspect
				todo = Todo.create(:title=> params[:title], :completed=> params[:completed])
				if todo.save
					render json:todo
				end
			end

			def update
				todo = Todo.find(params[:id])
				todo.update_attributes(:title=> params[:title], :completed=> params[:completed])
				render json: todo
			end

			def destroy
				todo = Todo.find(params[:id])
				todo.destroy
				head :no_content, status: :ok
			end
		end
	end
end