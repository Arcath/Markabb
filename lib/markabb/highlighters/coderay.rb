module Markabb
    module Highlighters
        class Coderay < Markabb::SyntaxHighlighter
            def parse(lang, s)
                "[nobbc]" + ::CodeRay.scan(s, lang).div(Markabb.config.coderay_options) + "[/nobbc]"
            end
        end
    end
end

Markabb.register_highlighter(:coderay, Markabb::Highlighters::Coderay)
