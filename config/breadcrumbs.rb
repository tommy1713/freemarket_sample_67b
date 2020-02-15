crumb :root do
  link "フリマ", root_path
end

# crumb :categories do
#   link "カテゴリー一覧", categories_path
#   parent :root
# end

# crumb :categryparent do |parent|
#   link "#{parent.name}", category_path(parent.id)
#   parent :categories
# end

# crumb :child do |child|
#   link "#{child.name}", category_path(child.id)
#   parent :categryparent
# end

# crumb :grandchild do |grandchild|
#   link "#{grandchild.name}", category_path(grandchild.id)
#   parent :child
# end

crumb :mypage do
  link "マイページ", "/users/:id"
  parent :root
end


crumb :card do
  link "支払い方法", card_index_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).