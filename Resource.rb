module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end
    if routes == PostsController
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp.upcase
        break if verb.downcase == 'q'

        action = nil

        if verb.upcase == 'GET'
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp
          break if action == 'q'
        end

        begin
          action.nil? ? routes[verb].call : routes[verb][action].call
        rescue
          puts "Enter error please follow instructions"
        end

      end
    else loop do
      print 'Choose verb to interact with resources (COMM) / q to exit:'
      verb = gets.chomp.upcase
      break if verb.downcase == 'q'

      begin
        routes[verb].call
      rescue
        puts "Enter error please follow instructions"
      end
    end
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = Hash[]
    @array = []
  end

  def index
    @posts.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def show
    puts 'Введите id'
    id = gets.to_i
    if @posts[id] != nil
      puts @posts[id]
    else
      puts "Такого id нет"
    end
  end

  def create
    puts 'Введите текст поста'
    text = gets.chomp
    if @array.size == 0
      number = @posts.size
      @posts[number] = text
      puts "#{number}:#{text}"
    else
      number = @array[0]
      @posts[number] = text
      puts "#{number} : #{text}"
    end
  end

  def update
    puts 'Введите id поста'
    id = gets.to_i
    if @posts[id] != nil
      puts 'Введите text'
      text = gets.chomp
      @posts[id] = text
    else
      puts 'Такого поста нет'
    end
  end

  def destroy
    puts 'Введите id'
    id=gets.to_i
    if @posts[id] != nil
      @array.unshift(id)
      @posts.delete(id)
    else
      puts "Такого поста нет"
    end
  end
end

class CommentsController
  extend Resource

  def initialize
    @commArr = []
  end

  def comments
    puts "Enter comment"
    comm = gets.chomp
    @commArr.unshift(comm)
    puts @commArr
  end

end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resou(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end
    puts 'Good bye!'
  end

  def resou(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'COMM' => controller.method(:comments)
    }
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
