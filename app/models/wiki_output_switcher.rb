class WikiOutputSwitcher
  def initialize(params)
    @params = params || {}
  end

  def response 
    return @response if @response

    @response = {}
    if @params[:body]
      @response[:wysiwyg] = GreenCloth.new(@params[:body]).to_html
      @response[:preview] = @response[:wysiwyg] 
    elsif @params[:body_wysiwyg]
      @response[:greencloth] = Undress(@params[:body_wysiwyg]).to_greencloth
      @response[:preview] = GreenCloth.new(@response[:greencloth]).to_html 
    end
    @response.each {|k,v| v.gsub!("\n", "__NEW_LINE__"); v.gsub!("\t", "__TAB_CHAR__")}
    @response
  end

  def to_json
    response.to_json
  end
end
