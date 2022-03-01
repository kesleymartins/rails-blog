module PostsHelper
    def limit_body_size(body)
        body.length > 50 ? "#{body[0..40]} ..." : body
    end
end
