declare module '@reactspring/react-native-jailbreak-detect' {
    function rootingCheck (parameters: string): Promise<string>;
    function jailBrokenCheck (parameters: string): Promise<string>;
}
