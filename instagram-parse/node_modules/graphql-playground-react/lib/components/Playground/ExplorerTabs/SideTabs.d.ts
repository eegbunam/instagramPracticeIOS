import * as React from 'react';
import { GraphQLSchema } from 'graphql';
export interface Props {
    schema: GraphQLSchema;
    sessionId: string;
    children: Array<React.ReactElement<any>>;
    maxWidth: number;
}
export interface SideTabContentProps {
    schema: GraphQLSchema;
    sessionId: string;
    setWidth: (props: any) => any;
}
export interface State {
    searchValue: string;
    widthMap: any;
}
declare const ConnectedGraphDocs: any;
export default ConnectedGraphDocs;
