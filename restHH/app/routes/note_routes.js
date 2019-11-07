var ObjectID = require('mongodb').ObjectID;
module.exports = function(app, db) {

  app.get('/hh/:id', (req, res) => {
    const id = req.params.id;
    const details = { '_id': new ObjectID(id) };
    db.collection('hh').findOne(details, (err, item) => {
      if (err) {
        res.send({'error':'An error has occurred'});
      } else {
        res.send(item);
      } 
    });
  });
  app.delete('/hh/:id', (req, res) => {
    const id = req.params.id;
    const details = { '_id': new ObjectID(id) };
    db.collection('hh').remove(details, (err, item) => {
      if (err) {
        res.send({'error':'An error has occurred'});
      } else {
        res.send('Note ' + id + ' deleted!');
      } 
    });
  });
  app.put ('/hh/:id', (req, res) => {
    const id = req.params.id;
    const details = { '_id': new ObjectID(id) };
    if (Object.keys(req.body) == 'tokenDevice'){
      var note = { tokenDevice: req.body.tokenDevice };
    };
    if (Object.keys(req.body) == 'name'){
      var note = { name: req.body.name };
    };
    if (Object.keys(req.body) == 'nameArray'){
      var note = { nameArray: req.body.nameArray };
    };
    if (Object.keys(req.body) == 'id'){
      var note = { id: req.body.id };
    };
    db.collection('hh').update(details, note, (err, result) => {
      if (err) {
        res.send({'error':'An error has occurred'});
      } else {
        res.send(note);
      } 
    });
  });
  app.post('/hh/:id', (req, res) => {
    const id = req.params.id;
    const details = { '_id': new ObjectID(id) };
    if (Object.keys(req.body) == 'tokenDevice'){
      var note = { tokenDevice: req.body.tokenDevice };
    }
    if (Object.keys(req.body) == 'name'){
      var note = { name: req.body.name };
    }
    if (Object.keys(req.body) == 'nameArray'){
      var note = { nameArray: req.body.nameArray };
    }
    if (Object.keys(req.body) == 'id'){
      var note = { id: req.body.id };
    };     
    db.collection('hh').update(details, note, (err, result) => {
      if (err) { 
        res.send({ 'error': 'An error has occurred' }); 
      } else {
        res.send(note);
      }
    });
  });
};
