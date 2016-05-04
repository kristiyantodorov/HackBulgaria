require 'sinatra'

id = 0

class Post
  attr_reader :id, :name, :content

  def initialize(id, name, content)
    @id = id
    @name = name
    @content = content
  end

  def to_s
    "#{@id.to_s} #{@name}  #{@content}<br>"
  end
end

posts = []

get '/' do
  posts.map(&:to_s)
end

get '/new' do
  erb :get_new
end

post '/new' do
  name = params[:name]
  content = params[:content]
  if posts.empty?
    posts << Post.new(1, name, content)
  else
    next_id = posts.last.id + 1
    posts << Post.new(next_id, name, content)
  end
  redirect '/'
end

get '/:id' do
  id = params[:id].to_i
  posts[id-1].to_s
end

__END__
@@get_new
<form method="post">
  <pre><strong>Enter post name:</strong></pre>
  <input type="text" name="name">
  <pre><strong>Enter post:</strong></pre>
  <input type="text" name="content">
  <input type="submit">
</form> 
 
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
