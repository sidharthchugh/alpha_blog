class ArticlesController < ApplicationController
    before_action :set_articles, only: [:edit, :update, :show, :destroy] # common method called before anything else

    def index
        @articles = Article.all # get all articles
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
           render 'new' 
        end
    end

    def show
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was sucessfly updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Articles was successfully deleted"
        redirect_to articles_path
    end

    private
        def set_articles
            @article = Article.find(params[:id])
        end
        def article_params
            params.require(:article).permit(:title, :description)
        end 
end