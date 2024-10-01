Feature: Gestión de Órdenes en PetStore

  Background:
    Given url "https://petstore.swagger.io/v2"

  Scenario Outline: Creación de Orden mediante POST
    Given path "/store/order"
    And request
    """
    {
      "id": <orderId>,
      "petId": <petId>,
      "quantity": <quantity>,
      "shipDate": "<shipDate>",
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match $.id == <orderId>
    And match $.status == "placed"
    And match $.quantity == <quantity>
    And match $.petId == <petId>
    Examples:
      | orderId | petId | quantity | shipDate               |
      | 1576    | 1001  | 2        | 2024-10-01T02:12:25.629Z |
      | 1577    | 1002  | 3        | 2024-10-02T05:30:00.000Z |

  Scenario Outline: Consulta de una Orden por ID
    Given path "/store/order/<orderId>"
    When method get
    Then status 200
    And match $.id == <orderId>
    And match $.status == "placed"
    Examples:
      | orderId |
      | 1576    |
      | 1577    |
