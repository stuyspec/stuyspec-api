class Resolvers::ArticleQueryFunction < GraphQL::Function

    def select_published(articles)
        # nil articles will be filtered out
        return nil if articles.nil?
        
        return articles.where(is_published: true)
    end

end
