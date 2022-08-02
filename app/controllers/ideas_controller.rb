class IdeasController < ApplicationController
    
    #=============callback =========
    
    before_action :find_idea, only: [:edit, :update, :show, :destroy]
    
    #=========create ============    
        def new
            @idea = Idea.new
        end
    
        def create
            @idea = Idea.new(idea_params)
            if @idea.save
                flash[:notice]= "Idea created sucessfully!"  #-->flash notice
                redirect_to idea_path(@idea)   
            else
                render :new
            end
        end
    #=================read==============
        def index
            @ideas = Idea.order(created_at: :desc)
        end
    
        def show   
        end
    #========================update==========================
        def edit
        end
    
        def update
            if @idea.update(idea_params)
                redirect_to idea_path(@idea)
            else
                render :edit
            end
        end
    #=================delete========================
        def destroy
            @idea.destroy
            redirect_to ideas_path 
        end
    #=============private====================
        private
    
        def idea_params
            params.require(:idea).permit(:title, :description)
            # the form use  form_with model:@idea, so the form name-value pair will store under the 
            #params[:idea], that's why we need to requeire(:idea)
        end
    
        def find_idea
            @idea = Idea.find params[:id]
        end


end
