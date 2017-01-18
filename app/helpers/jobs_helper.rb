module JobsHelper
  def render_job_status(job)
    if job.is_hidden
    # '(Hidden)'
    content_tag(:span, "", class: "fa fa-lock")
    else
    # '(Public)'
    content_tag(:span, "", class: "fa fa-globe")
    end
  end

  def render_highlight_content(job,query_string)
    excerpt_cont = excerpt(job.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end
end
