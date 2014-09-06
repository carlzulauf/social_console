module ApplicationHelper
  def page_title
    title = "Social Console"
    extra = content_for(:title)
    title = "#{title} | #{extra}" if extra
    title
  end

  def js_controller_setup
    controller = params[:controller].camelize
    json = {controller: controller, action: params[:action]}.to_json
    javascript_tag("SC.Controllers.params = #{json}")
  end
end
