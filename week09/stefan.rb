require 'sinatra'
curr_id = 0
class Post
  attr_reader :id, :name
 
  def initialize(id, name)
    @id = id
    @name = name
  end
end
 
POSTS = []
 
get '/' do
  POSTS.map(&:name).join(", ")
end
 
get '/new' do
  erb :get_new
end
 
post '/new' do
  POSTS << Post.new(curr_id, params[:post])
  curr_id = curr_id.next
  POSTS.map(&:name).join(", ")
end
 
get '/:number' do
  erb :get_number, :locals => {:name =>POSTS[params[:number].to_i].name}
end
 
delete '/:number' do
  POSTS.delete_at(params[:number].to_i)
 
  POSTS.map(&:name)
end
 
__END__
@@get_new
  <html>
    <body>
        <form method="post">
          Post :
          <input type="text" name="post">
          <input type="submit" value="Submit">
        </form>
    </body>
  </html>
 
@@get_number
  <html>
    <body>
        <form method="post">
          <%= name%>
          <input type="hidden" name="_method" value="delete">
          <input type="submit" value="Delete">
        </form>
    </body>
  </html>
