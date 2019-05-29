class Resolvers::ArticleQueryFunction < GraphQL::Function

    def select_published(articles)
        # nil articles will be filtered out
        if articles.nil?
            return nil
        end
        
        return articles.select do |a| !a.nil? && a.is_published end
    end

end
