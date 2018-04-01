1. What classes does each implementation include?
## Implementation A
- CartEntry
- ShoppingCart
- Order

## Implementation B
- CartEntry
- ShoppingCart
- Order

Are the lists the same?
- The lists are the same.

2. Write down a sentence to describe each class.
## Implementation A
- CartEntry - This class initializes the price of an item and its quantity, and allows read/write access to unit_price and quantity.
- ShoppingCart - This class creates an empty shopping cart and allows read/write access to entries.
- Order - This class initializes an empty cart, and calculates the total price of an order.

## Implementation B
- CartEntry - This class initializes the price of an item and its quantity, and calculates the price of a cart entry.
- ShoppingCart - This class creates an empty shopping cart, and calculates the sum cost of the cart entries.
- Order - This class initializes a shopping cart and calculates the total price of the items in the cart.

3. How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

## Implementation A
An Order creates a new ShoppingCart which holds CartEntry(cart entries). An Order also calculates the total price of all the entries by using information in the CartEntry class.

## Implementation B
An Order creates a new ShoppingCart. An Order calculates the total_price by calling a method in the ShoppingCart.

4. What data does each class store? How (if at all) does this differ between the two implementations?
## Implementation A
- CartEntry stores unit_price and quantity
- ShoppingCart stores entries
- Order stores a ShoppingCart and a total price.

## Implementation B
- CartEntry stores unit_price and quantity and a price for those.
- ShoppingCart stores a price for all entries.
- Order stores a ShoppingCart and a total price.

5. What methods does each class have? How (if at all) does this differ between the two implementations?
## Implementation A
- CartEntry has initialize only
- ShoppingCart has initialize only
- Order has initialize and total_price

## Implementation B
- CartEntry has initialize and price
- ShoppingCart has initialize and price
- Order has initialize and total_price

*Implementation B has at least two more methods.*

6. Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
Does total_price directly manipulate the instance variables of other classes?

## Implementation A
- Logic to compute price is retained in Order, and does use the variables of other classes.

## Implementation B
- Logic to compute price is delegated to "lower level" classes, and does _not_ use the variables of other classes.

7. If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
- In Implementation A the Order#total_price would need to be modified to have an if statement to check if each entry.quanitity is more than a certain amount. In Implementation B, CartEntry only needs to be modified and implementation doesn't depend on other Classes.

8. Which implementation better adheres to the single responsibility principle?
- Implementation B

9. Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
- Implementation B since each class knows very little about what methods another class has.
