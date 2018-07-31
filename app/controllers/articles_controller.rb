# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :is_admin
  before_action :logged_in

  def create
    article = Article.new(article_params)
    article.save
    redirect_to comunity_index_path
  end

  def destroy
    article = Article.find(params[:id])
    article.delete
    redirect_to comunity_index_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :link, :document)
    end
end
