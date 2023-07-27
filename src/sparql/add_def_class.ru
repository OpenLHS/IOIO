PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
#PREFIX cco: <http://www.ontologyrepository.com/CommonCoreOntologies/>
PREFIX cns: <http://purl.obolibrary.org/obo/OpenLHS-Core_0000062>
PREFIX cn: <http://purl.obolibrary.org/obo/OpenLHS-Core_0000061>
PREFIX def: <http://purl.obolibrary.org/obo/IAO_0000115>

INSERT { ?subject def: ?object}
WHERE {
  {
    ?subject a owl:Class .
  ?subject cns: ?object . 
  ?subject ?predicate ?object .
}
UNION {
    ?subject a owl:Class .
    ?subject cn: ?object .
    FILTER NOT EXISTS {?subject cns: ?object1} .
    ?subject ?predicate ?object
  }
    FILTER contains(STR(?subject), "IOIO")
}
