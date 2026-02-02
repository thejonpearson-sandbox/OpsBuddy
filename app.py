import streamlit as st

st.title("OpsBuddy")
st.header("Status Check")

mock_data = {
    "Development":"🟢 Healthy",
    "Production":"🔴 Critical Alert"
}

selected_env = st.selectbox("Select Environment", ["Development", "Production"])
#st.write(f"You selected: {selected_env}")
st.subheader(f"Status of {selected_env}: {mock_data.get(selected_env)}")

if st.button("Refresh Status"):
    st.toast(f"Status Refreshed!")