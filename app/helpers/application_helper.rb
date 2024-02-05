module ApplicationHelper
  BASE_TITLE = "Law Office Search".freeze

  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end

  def sort_class(column)
    return 'sort-link active' if params[:sort] == column.to_s
    'sort-link'
  end

  def format_postal_code(postal_code)
    "〒#{postal_code[0..2]}-#{postal_code[3..6]}"
  end
end
