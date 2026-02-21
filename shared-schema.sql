-- Owners table
CREATE TABLE owners (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name VARCHAR(255) NOT NULL,
    founded_year INT,
    headquarters VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Franchises table
CREATE TABLE franchises (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name VARCHAR(255) NOT NULL,
    owner_id UUID REFERENCES owners(id) ON DELETE CASCADE,
    description TEXT,
    year_established INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Movies table
CREATE TABLE movies (
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
CREATE TABLE cast_members (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name VARCHAR(255) NOT NULL,
    movie_id UUID REFERENCES movies(id) ON DELETE CASCADE,
    character_name VARCHAR(255),
    role VARCHAR(100) CHECK (role IN ('ACTOR', 'DIRECTOR', 'PRODUCER', 'WRITER')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Box office table
CREATE TABLE box_office (
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
CREATE TABLE images (
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
