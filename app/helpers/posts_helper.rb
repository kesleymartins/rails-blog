module PostsHelper
    def limit_body_size(body)
        body.length > 50 ? "#{body[0..46]} ..." : body
    end
end
