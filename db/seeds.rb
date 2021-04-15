SELLERS = [
    "John Smith",
    "Owen Jones",
    "Mark Wilson",
    "Sam Piper",
    "Tony Watson",
    "Seamus Austin",
    "Peter Hamill",
    "Paul Newman",
    "Jane Taylor",
    "Stacy Foster",
    "Mary Johnson",
    "Elizabeth Walker",
    "Annie Potter",
    "Pauline Hooper",
    "Jennifer Hamilton",
    "Roger Taylor",
    "Suzanne Jackson",
    "Danny Jackobs"
]

AVERAGE_LATLNG = {
    lat: 51.501364, 
    lng: -0.141890 
}

LISTING_START = [
    "Pre-loved",
    "Well used",
    "Good as new"
]

LISTING_END = [
    "item",
    "heirloom",
    "furniture",
    "treasure",
    "piece"
]

def make_sellers
    SELLERS.each do |user|
        params = {}

        username = user.split.collect.with_index{|n,i| i == 0 ? n[0] : n}.join
        params[:email] = username + "@email.com"
        params[:password] = username
        params[:password_confirmation] = username

        Seller.create(params)
    end
end

def make_listings

    paths = Dir.glob("#{Rails.root}/app/assets/seed_images/furniture/*.jpg")
    
    byebug

    Seller.all.each{|s| 
        20.times {
            path = paths.sample
            s.listings.create({
                name: [LISTING_START.sample, LISTING_END.sample].join(" "), 
                description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi."
            }).image.attach(io: File.open(File.expand_path(path)), filename: "#{path}.jpg")
        }
    }
end

Seller.all.each{|s| s.destroy}

make_sellers
make_listings