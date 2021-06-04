import React from 'react';

import BestSellers from '../BestSellers';
import { shallow, configure } from 'enzyme';

import Adapter from 'enzyme-adapter-react-16';
configure({adapter: new Adapter()});

//This is the required header that we wish to see in the test
const requiredHeader = "Top 20 best sellers";
test("Heading for Best Seller renders correct heading text", () => {
    //Using shallow render of the best sellers module
    const component = shallow(<BestSellers/>);
    //Expect to find a header 3 equal to the text specified in required header
    expect(component.find('h3').text()).toEqual(requiredHeader);
})