module Markabb
    module Highlighters
        # Markabb Syntax Highlighter for CodeRay
        #
        # See http://http://coderay.rubychan.de/ for CodeRay
        class Coderay < Markabb::SyntaxHighlighter
            # Takes the language and string as an option and passes config from Markabb for coderay
            #
            # See http://coderay.rubychan.de/ for CodeRays configuration options
            def parse(lang, s)
                "[nobbc]" + ::CodeRay.scan(s, lang).div(Markabb.config.coderay_options) + "[/nobbc]"
            end
        end
    end
end

Markabb.register_highlighter(:coderay, Markabb::Highlighters::Coderay)
