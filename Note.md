1.rails new muse -d postgresql  //create a rails obj with postgresql data base 
2.rails db:create //create new DB it should be two
3.rails db:migrate  //t
5.rails c 
    1.rails Artist.count
    2. Artist.all
    3. a = Artist.new( name:"Obaid", hometown:"Riyadh" ,img:"",albums:2) //does not save in db yet  
        -- to save it use a.save 
        --to save it dirctleay use Artist.create (...)
        --save it to varible  b=Artist.create( name:"Hazam", hometown:"Riyadh" ,img:"",albums:3) ,
    4. b.destroy  //drop one row of the table  
6.post the code to seed for creating data automatically to artist DB.
```
    Artist.create(name: "Rihanna", albums: 6, hometown: "Barbados", img: "http://mccarthyamp.com/wp-content/uploads/2016/02/23445669273_bfc7c4062b_b.jpg")
    Artist.create(name: "Taylor Swift", albums: 8, hometown: "Nashville", img: "https://upload.wikimedia.org/wikipedia/en/f/f6/Taylor_Swift_-_1989.png")
    Artist.create(name: "Billy Joel", albums: 14, hometown: "Long Island", img: "https://images-na.ssl-images-amazon.com/images/I/81RgoBLQOKL._SY355_.jpg")
    Artist.create(name: "Drake", albums: 4, hometown: "Toronto", img: "http://images.complex.com/complex/image/upload/t_in_content_image/drake-thank-me-later-album-cover_o6ek33.jpg")
    Artist.create(name: "Beyonce", albums: 6, hometown: "Houston", img: "http://www.fuse.tv/image/571c26a6017704456e00001b/816/545/beyonce-lemonade-album-cover-full.jpg")
```

7.rails db:seed 
8.rails c
    1.adele = Artist.new(name: "Adele", hometown: "London", albums: 3, img: "https://pbs.twimg.com/profile_images/657199367556866048/EBEIl2ol.jpg")
   
    2.adele.save
    3. operation  //commands that we can use
        1.Artist.all
        2.Artist.first
        3.Artist.find_by_name('Adele')
        4.Artist.find_by(name: 'Adele')
        5.Artist.find(2)
        6.Artist.where(name: 'Adele', hometown: 'London')
    4. adele.hometown // show adele variable  hometown 

    5.britney = Artist.find_by_name('Adele')
    6.britney.name = 'Britney'
    7.britney.save // save it to DB
    8.adele = Artist.find_by_name('Britney')
    9.adele.update(name: 'Adele') 
      //  --Update the DB without using adele.save .
      //  --adele Artist.new()create class/hash in  memory and stores the address of the hash to adele variable 
      //      ---So it needs to be saved in DB by adele.save
    10.adele = Artist.find_by_name('Adele')
    11.adele.destroy
    12.Artist.all
    13. rails g model Song artist:references title genre  
      //  --create model called Song with artist title genre 
      //  --model name should be capital
    14. rails db:migrate 
    15. check muse/db/migrate files.It should has artists,songs files with all attributes of each one  

    16.rails db:rollback STEP=1  //we made a mistake in Song model.will not destroy the DB 
            //this command  go back one step 
    17.rails d model Song //16 & 17 destroy the moudle from b

    18.rails g model Song artist:references title genre
    19.rails db:migrate

    20. check schema.rb last line should  
    ''' add_foreign_key "songs", "artists"  '''

------------
21.add artist.rb  /muse/app/models/artist.rb  
  //dependent is key destroy is symble //artist has meny songs relationship 
    '''has_many :songs, dependent: :destroy'''
22.replace all the code in seeds.rb     /muse/db/seeds.rb 
    -- since we drop two artist .we will drop all DBs and recreate it using next command  

    '''
    Artist.create(name: "Rihanna", albums: 6, hometown: "Barbados", img: "http://mccarthyamp.com/wp-content/uploads/2016/02/23445669273_bfc7c4062b_b.jpg")
    Artist.create(name: "Taylor Swift", albums: 8, hometown: "Nashville", img: "https://upload.wikimedia.org/wikipedia/en/f/f6/Taylor_Swift_-_1989.png")
    Artist.create(name: "Billy Joel", albums: 14, hometown: "Long Island", img: "https://images-na.ssl-images-amazon.com/images/I/81RgoBLQOKL._SY355_.jpg")
    Artist.create(name: "Drake", albums: 4, hometown: "Toronto", img: "http://images.complex.com/complex/image/upload/t_in_content_image/drake-thank-me-later-album-cover_o6ek33.jpg")
    Artist.create(name: "Beyonce", albums: 6, hometown: "Houston", img: "http://www.fuse.tv/image/571c26a6017704456e00001b/816/545/beyonce-lemonade-album-cover-full.jpg")

    Song.create(artist_id: 1, title: "Umbrella", genre: "Pop")
    Song.create(artist_id: 2, title: "Shake It Off", genre: "Pop")
    Song.create(artist_id: 3, title: "Pressure", genre: "Rock")
    Song.create(artist_id: 4, title: "Hotline Bling", genre: "Rap")
    Song.create(artist_id: 5, title: "Lemonade", genre: "R&B")
    '''
23.rails db:drop db:create db:migrate db:seed  //4 commands once 
    --if you got error
    1.psql
     1.\c muse_development
        1.SELECT pid, pg_terminate_backend(pid) 
          FROM pg_stat_activity 
          WHERE datname = current_database() AND pid <> pg_backend_pid();
24. rails c // to check 
    //songs should not be exsist if no artist 
    1.Artist.count # 5
    2.Song.count  # 5
    3.rihanna =Artist.first 
    4.rihanna
    5.rihanna.Songs 
    6.diamonds=rihanna.songs.new   //song not capital s since it is obj inside obj    
    7.diamonds.title='Diamonds'
    8.diamonds.save
    9.rihanna.songs  //to check songs "s" is small 
    10.rihanna.songs.create(title:"Work") //use create
    11.rihanna.songs.find_by_title('Diamonds')
    12.rihanna.songs[1].update(genre: "Gospel")
    13.rihanna.songs
    14.diamonds = rihanna.songs.find_by_title('Diamonds')
    15.Song.count  #7
    16.diamonds.destroy 
    17.Song.count  #6

//afternoon 
* we have two models songs and artits 
resource 
1.go routes  write and save these two line 
    '''
      root 'artists#index'
     resources :artists  //refire to
  '''
2.rails routes //to check 

3.rails g controller artists //controller with polural  module singler 
4. add to /muse/app/controllers/artists_controller.rb  
```
 def index 
      @artists = Artist.all  
  end

```
5.create index.html.rb inside muse/app/views/artists/index.html.erb
 
 '''
 <h1>All the Artists</h1>

<table class="striped bordered">
  <tr>
    <th>Artist</th>
    <th>Image</th>
    <th>Albums</th>
    <th>Hometown</th>
  </tr>

  <% @artists.each do |artist| %>
      <tr>
        <td><%= link_to artist.name, artist_path(artist) %></td>
        <td><%= image_tag(artist.img, size: "100x100", alt: "Artist Image") %></td>
        <td><%= artist.albums %></td>
        <td><%= artist.hometown %></td>
      </tr>
  <% end %>
</table>

'''
 click on artists get error there is no show action  

 7. add show methods  /muse/app/controllers/artists_controller.rb 
 '''
 def show
  @artist = Artist.find(params[:id])
  @songs = @artist.songs
end
 
 '''

8.create show.html.erb in /muse/app/views/artists/
'''
    <h1><%= @artist.name %> Songs</h1>
    <%= link_to "New Song", new_song_path(:artist_id => @artist.id), { :class => "button waves-effect waves-light btn" } %>
    <br><br>

    <div class="row">
    <% @songs.each do |song| %>

        <div class="card-panel grey lighten-2 col s4" style="margin: 10px">
            <%= image_tag(@artist.img, size: "100x100", alt: "Artist Image") %>
            <br>
            <strong><%= link_to song.title %></strong>
            <em><%= song.genre %></em>
        </div>
    <% end %>
    </div>

'''
will get error 
9.edit routes
'''
    root 'artists#index'
    resources :artists, :songs
  '''

10.edit /muse/app/controllers/artists_controller.rb
'''
  ##create an obj that view can fill it and edit ,than call create action methouds
  def new
    @artist = Artist.new
end

'''
11. create _form.html.erb /muse/app/views/artists/_form.html.erb  // using "_" in file name to be hidden 
and write 

اسال كيف يكلم كرييت 
```

<%= form_for @artist do |f| %>
  <div class="input-field col s6">
      <%= f.label :name, 'Name'%>
      <%= f.text_field :name%>
  </div>
  <div class="input-field col s6">
      <%= f.label :albums, 'Albums' %>
      <%= f.text_field :albums %>
  </div>
  <div class="input-field col s6">
      <%= f.label :hometown, 'Hometown' %>
      <%= f.text_field :hometown %>
  </div>
  <div class="input-field col s6">
      <%= f.label :img, 'Image' %>
      <%= f.text_field :img %>
  </div>
  <%= f.submit "Submit", :class => "btn waves-effect waves-light" %>
<% end %>

```
12.create new.html.erb 
'''
<h1>New Artist</h1>

<%= render 'artists/form' %>

'''

13. add to index.html.erb to create linker on the page 
'''
 <%= link_to "Add an Artist", new_artist_path, { :class => "button waves-effect waves-light btn" } %>
<br>
'''

14. add create action to /muse/app/controllers/artists_controller.rb 
    --needs parmas that comes from new 
    -- since it is post needs permission to op on DB 
    --debugging use params in browser 

```
def create
  Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img))
  redirect_to artists_path
end
    ```
15.rails routs //to check all gets req for new artist
16. update and add  /muse/app/controllers/artists_controller.rb
'''
   def edit
        @artist = Artist.find(params[:id])
    end
    '''
17.create and add code to  edit.html.erb /muse/app/views/artists/edit.html.erb
```
<h1>Edit <%= @artist.name %></h1>

<%= render 'artists/form' %>
```
18. add and edit index.html.erb
```
<h1>All the Artists</h1>
<%= link_to "Add an Artist", new_artist_path, { :class => "button waves-effect waves-light btn" } %>
<br><br>

<table class="striped bordered">
  <tr>
    <th>Artist</th>
    <th>Image</th>
    <th>Albums</th>
    <th>Hometown</th>
    <th>Edit</th>
  </tr>

  <% @artists.each do |artist| %>
      <tr>
        <td><%= link_to artist.name, artist_path(artist) %></td>
        <td><%= image_tag(artist.img, size: "100x100", alt: "Artist Image") %></td>
        <td><%= artist.albums %></td>
        <td><%= artist.hometown %></td>
        <td><a class="btn-floating btn-large red" href="<%= edit_artist_path(artist) %>" >
           <em class="large material-icons">Edit Artist</em>
          </a>
        </td>
      </tr>
  <% end %>
</table>

```

19. add update action to /muse/app/controllers/artists_controller.rb
```
  def update
      artist = Artist.find(params[:id])
      artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))   
      redirect_to artist
      
    end 
```

20. add destroy action and update muse/app/controllers/artists_controller.rb
    ```
def destroy
  Artist.find(params[:id]).destroy

  redirect_to artists_path ## since it is not react we need to redirict 
end

    ```


21. add and update index.html.erb // for destroy 
    --- data-method  is importent 
```

<h1>All the Artists</h1>
<%= link_to "Add an Artist", new_artist_path, { :class => "button waves-effect waves-light btn" } %>
<br><br>

<table class="striped bordered">
  <tr>
    <th>Artist</th>
    <th>Image</th>
    <th>Albums</th>
    <th>Hometown</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>

  <% @artists.each do |artist| %>
      <tr>
        <td><%= link_to artist.name, artist_path(artist) %></td>
        <td><%= image_tag(artist.img, size: "100x100", alt: "Artist Image") %></td>
        <td><%= artist.albums %></td>
        <td><%= artist.hometown %></td>
        <td><a class="btn-floating btn-large red" href="<%= edit_artist_path(artist) %>" >
                      <i class="large material-icons">mode_edit</i>
                </a>
          </td>
        <td><a class="btn-floating btn-large red" data-confirm="Are you sure you want to delete <%= artist.name %>?" data-method="delete" href="/artists/<%= artist.id %>" rel="nofollow"><i class="large material-icons">Delete Artist</i>
           </a>
        </td>
      </tr>
  <% end %>
</table>

```

############ Work on song modle #######
    DB song
        title
        Genre
show(params)=>new(params)=>_form(params)=>create(params)
  
  / ملاحضة في الكنترول حاول تسوي خطاء عشان تستخدم        
بارمس وتعرف كل المتغيرات الي دخلت على الاكشن 

 new get proms transfare it to form and create take proms from form
1. rails g  controller songs
2. edit  songs_controller.rb    /muse/app/controllers/songs_controller.rb  
    --sequence of params "Ask TA to make sure "
        ---show.html=>new.html=>songform.html =>where can create action use it 
    -- use console that show up in the browser for debugging also for params
```
  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    artist = Artist.find(params[:song][:artist_id])
    Song.create(params.require(:song).permit(:title, :genre, :artist_id))
    redirect_to artist
  end

```
3.create dir view and create  new.html.erb inside it   
```
<h1>New Song for <%= @artist.name %></h1>

<%= render 'songs/form' %>

```
4.create  _form.html.erb and edit   /muse/app/controllers/songs_controller.rb
    --file start with "_" symbol is hidden 
    --
    ```
    <%= form_for @song do |f| %>
  <%= f.hidden_field :artist_id, :value => @artist.id %>
  <div class="input-field col s6">
      <%= f.label :title, 'Title' %>
      <%= f.text_field :title %>
  </div>
  <div class="input-field col s6">
      <%= f.label :genre, 'Genre' %>
      <%= f.text_field :genre %>
  </div>
  <%= f.submit "Submit", :class => "btn waves-effect waves-light" %>
<% end %>

```

5.edit /muse/app/controllers/artists_controller.rb
//add order method to organize the list
```
Artist.all.order('name') 
``` 
6.edit artists_controller.rb
    -- take advantage of private by making this line in a method that is called each time instead of 
    ```
                params.require(:artist).permit(:name, :albums, :hometown, :img)

``` 
 
-------------------------------

## seeds.rb  
// run all CRUD auto
    
risk of routing is way to  ضسعت اساله 

modle we can put our condation 
it is safe if we have two layers of securoty one in model and the other in DB

gem install prettyprint //مهم


--------------------------------
rails confantion 
put patch ==>for updata 
browser ->(http req ,url) web server->public 


## Standard Controller Actions
    resource : https://www.codecademy.com/articles/standard-controller-actions


مخفس
http

erb 
params