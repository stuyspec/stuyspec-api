class Resolvers::ArticleQueryFunction < GraphQL::Function

    def select_published(articles)
        # nil articles will be filtered out
        if articles.nil?
            return nil
        end
        
        return articles.where(is_published: true)
    end

end
