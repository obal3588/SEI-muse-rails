1.rails new muse -d postgresql  //create a rails obj with postgresql data base 
2.rails db:create //create new DB it should be two
3.rails db:migrate 
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
22.replace all the code in seeds.rb     /home/obaid/sei/projects/muse/db/seeds.rb 
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
24. rails c // to check 
    1.Artist.count # 5
    2.Song.count  # 5
    3. rihanna =Artist.first 
    4.rihanna
    5.rihanna.Songs 

 

    


-------------------------------

## seeds.rb  
// run all CRUD auto
    
risk of routing is way to  ضسعت اساله 

modle we can put our condation 
it is safe if we have two layers of securoty one in model and the other in DB

