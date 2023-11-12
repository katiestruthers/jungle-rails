describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('opens the app', () => {})

  it("clicking 'Add' button increases cart count to 1", () => {
    cy.get(".products button")
      .first()
      .click({force: true})

    cy.get(".end-0 a")
      .contains(" My Cart (1) ")
  });
})