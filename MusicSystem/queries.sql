SELECT cd.title, rd.disk_id, cd.year, pm.title, rd.no_track
FROM recorded_disks as rd
LEFT JOIN compact_disks AS cd
ON cd.disk_id = rd.disk_id
LEFT JOIN pieces_of_music AS pm
on rd.track_id = pm.track_id
WHERE rd.disk_id = 'X01';

SELECT pm.title AS 'Song title', ps.name AS 'Name', ins.name AS 'Instrument/authorship'
FROM plays as p
LEFT JOIN pieces_of_music as pm
	ON p.track_id = pm.track_id
LEFT JOIN persons as ps
	ON p.person_id = ps.person_id
LEFT JOIN instruments AS ins
	ON p.instrument_id = ins.instrument_id
WHERE pm.title = 'I will follow'
UNION
SELECT pm.title AS 'Song title', ps.name AS 'Name', auts.type AS 'Instrument/authorship'
FROM author_of as ao
LEFT JOIN pieces_of_music as pm
	ON ao.track_id = pm.track_id
LEFT JOIN persons as ps
	ON ao.person_id = ps.person_id
LEFT JOIN authorships AS auts
	ON ao.authorship_id = auts.authorship_id
WHERE pm.title = 'I will follow';

SELECT ps.name, ins.name
FROM instruments as ins
LEFT JOIN plays AS p
	ON ins.instrument_id  = p.instrument_id
LEFT JOIN persons AS ps
	ON p.person_id = ps.person_id
WHERE ins.name = 'GUITAR';

SELECT pm.title AS 'Song title', 
	   cd.year,
       rd.no_track,
       ps.name AS 'Name', 
       ps.nationality, 
       ins.name AS 'Instrument/authorship'
FROM pieces_of_music as pm
LEFT JOIN recorded_disks as rd
	ON pm.track_id = rd.track_id
LEFT JOIN compact_disks as cd
	ON rd.disk_id = cd.disk_id    
LEFT JOIN plays as p
	ON p.track_id = pm.track_id
LEFT JOIN persons as ps
	ON p.person_id = ps.person_id
LEFT JOIN instruments AS ins
	ON p.instrument_id = ins.instrument_id
UNION
SELECT pm.title AS 'Song title',
	   cd.year,
       rd.no_track,
	   ps.name AS 'Name',
       ps.nationality,
       auts.type AS 'Instrument/authorship'
FROM pieces_of_music as pm
LEFT JOIN recorded_disks as rd
	ON pm.track_id = rd.track_id
LEFT JOIN compact_disks as cd
	ON rd.disk_id = cd.disk_id 
LEFT JOIN author_of as ao
	ON ao.track_id = pm.track_id
LEFT JOIN persons as ps
	ON ao.person_id = ps.person_id
LEFT JOIN authorships AS auts
	ON ao.authorship_id = auts.authorship_id;