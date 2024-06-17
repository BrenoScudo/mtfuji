package org.generation.italy.mtfuji.dto;

public class TokenResponseDTO {

    private String token;
    private String errorMessage;

    public static class TokenResponseDTOBuilder{

        private String token;
        private String errorMessage;

        public  TokenResponseDTOBuilder setToken(String token){
            this.token = token;
            return this;
        }

        public  TokenResponseDTOBuilder setErrorMessage(String errorMessage){
            this.errorMessage = errorMessage;
            return this;
        }

        public TokenResponseDTO build(){
            TokenResponseDTO dto = new TokenResponseDTO();
            if (token != null){
                dto.token = token;
            }
            if (errorMessage != null){
                dto.errorMessage = errorMessage;
            }
            return dto;
        }
    }

    public static TokenResponseDTOBuilder builder(){
        return new TokenResponseDTOBuilder();
    }

    public String getToken() {
        return token;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}
