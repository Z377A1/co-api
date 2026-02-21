-- Owners table
CREATE TABLE IF NOT EXISTS owners (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name VARCHAR(255) NOT NULL,
    founded_year INT,
    headquarters VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Franchises table
CREATE TABLE IF NOT EXISTS franchises (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name VARCHAR(255) NOT NULL,
    owner_id UUID REFERENCES owners(id) ON DELETE CASCADE,
    description TEXT,
    year_established INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Movies table
CREATE TABLE IF NOT EXISTS movies (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    title VARCHAR(255) NOT NULL,
    franchise_id UUID REFERENCES franchises(id) ON DELETE CASCADE,
    release_date DATE,
    duration_minutes INT,
    budget DECIMAL(15,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cast members table
CREATE TABLE IF NOT EXISTS cast_members (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name VARCHAR(255) NOT NULL,
    movie_id UUID REFERENCES movies(id) ON DELETE CASCADE,
    character_name VARCHAR(255),
    role VARCHAR(100) CHECK (role IN ('ACTOR', 'DIRECTOR', 'PRODUCER', 'WRITER')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Box office table
CREATE TABLE IF NOT EXISTS box_office (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    movie_id UUID REFERENCES movies(id) ON DELETE CASCADE,
    revenue DECIMAL(15,2) NOT NULL,
    region VARCHAR(100) NOT NULL,
    ticket_sales INT,
    report_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Images table
CREATE TABLE IF NOT EXISTS images (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    movie_id UUID REFERENCES movies(id) ON DELETE CASCADE,
    url TEXT NOT NULL,
    type VARCHAR(50) CHECK (type IN ('POSTER', 'STILL', 'LOGO', 'BACKDROP')),
    width INT,
    height INT,
    alt_text VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO owners (id, name, founded_year, headquarters) VALUES
('019c2094-3f63-77ff-8fd0-aa9d18074360', 'Disney', 1923, 'Burbank, California'),
('019c2095-4a53-7744-9de4-55552c3b1777', 'Warner Bros.', 1923, 'Burbank, California'),
('019c2095-4a53-76f1-9e33-b2abd9d23e5c', 'Universal Pictures', 1912, 'Universal City, California');

INSERT INTO franchises (id, name, owner_id, description, year_established) VALUES
('019c2095-4a53-77d2-ab2c-a45daca80c72', 'Marvel Cinematic Universe', '019c2094-3f63-77ff-8fd0-aa9d18074360', 'Superhero film series', 2008),
('019c2095-4a53-7e65-9aca-252ed89d3296', 'Harry Potter', '019c2095-4a53-7744-9de4-55552c3b1777', 'Wizarding world film series', 2001),
('019c2095-4a53-72bd-aa8f-5904b52dd9b1', 'Fast & Furious', '019c2095-4a53-76f1-9e33-b2abd9d23e5c', 'Action film series', 2001);

-- Insert sample movies (using existing franchise UUIDs)
INSERT INTO movies (id, title, franchise_id, release_date, duration_minutes, budget) VALUES
-- Marvel movies
('019c8079-b5de-782f-bed9-81d0b6f3084c', 'Iron Man', '019c2095-4a53-77d2-ab2c-a45daca80c72', '2008-05-02', 126, 140000000),
('019c807a-85d9-7d2b-9c34-8f715c48b1be', 'The Avengers', '019c2095-4a53-77d2-ab2c-a45daca80c72', '2012-05-04', 143, 220000000),
('019c807a-85d9-7a3a-991f-20531167f51c', 'Avengers: Endgame', '019c2095-4a53-77d2-ab2c-a45daca80c72', '2019-04-26', 181, 356000000),

-- Harry Potter movies
('019c807a-85d9-7cd0-b4ca-a09c5b901e1b', 'Harry Potter and the Sorcerer''s Stone', '019c2095-4a53-7e65-9aca-252ed89d3296', '2001-11-16', 152, 125000000),
('019c807a-85d9-7db8-a3b1-90eee7bbbf1e', 'Harry Potter and the Chamber of Secrets', '019c2095-4a53-7e65-9aca-252ed89d3296', '2002-11-15', 161, 100000000),
('019c807a-85d9-7632-84df-3f03cd50fbc0', 'Harry Potter and the Deathly Hallows Part 2', '019c2095-4a53-7e65-9aca-252ed89d3296', '2011-07-15', 130, 125000000),

-- Fast & Furious movies
('019c807a-85d9-7472-8d19-e48a1b6ccd16', 'The Fast and the Furious', '019c2095-4a53-72bd-aa8f-5904b52dd9b1', '2001-06-22', 106, 38000000),
('019c807a-85d9-7b58-bd3c-4d2faec7e74a', 'Fast & Furious 7', '019c2095-4a53-72bd-aa8f-5904b52dd9b1', '2015-04-03', 137, 190000000),
('019c807a-85d9-76f7-b59e-8fd57ed4c424', 'F9: The Fast Saga', '019c2095-4a53-72bd-aa8f-5904b52dd9b1', '2021-06-25', 145, 200000000);
