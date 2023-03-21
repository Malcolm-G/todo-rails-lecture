class TodosController < ApplicationController
    wrap_parameters format: []
    def get_todos
        render json: Todo.all
    end

    def create
        # title = todo_params[:title]
        # description = todo_params[:description]
        # priority = todo_params[:priority]

        # #add todo to db
        # todo = Todo.create(title:title,description:description,priority:priority)

        todo = Todo.create(todo_params)
        if todo.valid?
            render json:todo, serializer: TodoSerializer
        else
            render json: todo.errors
        end

    end

    def update
        byebug
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.update(todo_params)

        render json: {message: "Updated Todo successfully"}
    end

    def delete
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.destroy

        render json: {message: 'delete todo successful'}
    end

    private

    def todo_params
        params.permit(:title,:description,:priority,:status)
    end

end
